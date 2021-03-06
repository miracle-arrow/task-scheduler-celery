"""empty message

Revision ID: 9045e085ceb9
Revises: 
Create Date: 2020-10-19 09:00:36.922674

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9045e085ceb9'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('tasks',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('machine', sa.String(), nullable=True),
    sa.Column('completed', sa.Boolean(), nullable=True),
    sa.Column('name', sa.String(), nullable=True),
    sa.Column('guide', sa.String(), nullable=True),
    sa.Column('description', sa.String(), nullable=True),
    sa.Column('hours', sa.String(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('tasks')
    # ### end Alembic commands ###
