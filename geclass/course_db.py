"""A class to handle the course management."""
import logging

from geclass.db import DBConnection

log = logging.getLogger(__name__)


class CourseDB(DBConnection):
    """Handle the course  management."""

    def get_courses(self, user_id):
        """Fetch all coursed from user with given id.

        Args:
            user_id (int): The id of the owner of the courses.

        Returns:
            A list of all the sqlite3 rows of the courses.

        >>> courses = get_courses(user_id=1)
        >>> for course in courses:
        ...     print(course['course_identifier'])
        'uni_potsdam_biochem_2018'
        'uni_potsdam_phys_2018'

        """
        return self.select_all(table='course', column='user_id', value=user_id)

    def add_course(self, user_id, fields):
        """Add a new course to the database.

        Args:
            user_id (int): The id of the owner of the course.
            course_name (str): Some name for the course. It
                               does not need to be unique.

        >>> get_courses(user_id=1)
        >>> for course in courses:
        ...     print(course['name'])
        'uni_potsdam_biochem_2018'
        'uni_potsdam_phys_2018'
        >>> add_course(user_id=1, name='a_new_name')
        >>> get_courses(user_id=1)
        >>> for course in courses:
        ...     print(course['name'])
        'uni_potsdam_biochem_2018'
        'uni_potsdam_phys_2018'
        'a_new_name'

        """
        log.info('Added new course %s for user %s', fields['name'], user_id)
        columns, values = [], []
        for key in fields:
            columns.append(key)
            values.append(fields[key])
        self.add(
            table='course',
            columns=columns,
            values=values)

    def get_overview(self, user_id):
        sql = """
            SELECT
              course.name,
              university.university_name,
              program.program_name,
              experience.experience_level,
              number_students,
              strftime('%d.%m.%Y', start_date_pre, 'unixepoch'),
              strftime('%d.%m.%Y', start_date_post, 'unixepoch')
            FROM course, university, program, experience
            WHERE course.user_id = ?
              AND university.id = course.university_id
              AND program.id = course.program_id
              AND experience.id = course.experience_id"""
        return self.execute(sql, (user_id,)).fetchall()

    def _add_and_get_new_id(self, table, column, value):
        log.info('Add new value %s to table %s', value, table)
        self.add(table, (column,), (value,))
        new_entry = self.select_one(table, column, value)
        return new_entry['id']

    def add_and_get_id_university(self, value):
        return self._add_and_get_new_id('university', 'university_name', value)

    def add_and_get_id_equipment(self, value):
        return self._add_and_get_new_id('equipment', 'equipment_type', value)



